-- Migration: 20240101000002_create_topics
-- Creates the topics table with RLS for user-scoped access.

CREATE TYPE public.topic_status AS ENUM ('draft', 'published', 'archived');

CREATE TABLE IF NOT EXISTS public.topics (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id     UUID NOT NULL REFERENCES auth.users (id) ON DELETE CASCADE,
  title       TEXT NOT NULL CHECK (char_length(title) BETWEEN 1 AND 255),
  description TEXT CHECK (char_length(description) <= 2000),
  status      public.topic_status NOT NULL DEFAULT 'draft',
  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS topics_user_id_idx ON public.topics (user_id);
CREATE INDEX IF NOT EXISTS topics_status_idx  ON public.topics (status);

-- Auto-update updated_at
CREATE OR REPLACE FUNCTION public.set_updated_at()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS set_topics_updated_at ON public.topics;
CREATE TRIGGER set_topics_updated_at
  BEFORE UPDATE ON public.topics
  FOR EACH ROW
  EXECUTE FUNCTION public.set_updated_at();

-- ============================================================
-- RLS: topics
-- ============================================================
ALTER TABLE public.topics ENABLE ROW LEVEL SECURITY;

-- Users may only select their own topics
CREATE POLICY "topics: select own"
  ON public.topics
  FOR SELECT
  USING (auth.uid() = user_id);

-- Users may only insert topics for themselves
CREATE POLICY "topics: insert own"
  ON public.topics
  FOR INSERT
  WITH CHECK (auth.uid() = user_id);

-- Users may only update their own topics
CREATE POLICY "topics: update own"
  ON public.topics
  FOR UPDATE
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- Users may only delete their own topics
CREATE POLICY "topics: delete own"
  ON public.topics
  FOR DELETE
  USING (auth.uid() = user_id);
