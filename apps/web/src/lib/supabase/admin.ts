import { createServerClient } from "@supabase/ssr";
import { createClient as createSupabaseAdmin } from "@supabase/supabase-js";
import type { Database } from "@graphed/supabase-types";
import { validateServerEnv } from "@/lib/env";

export function createAdminClient() {
  const serverEnv = validateServerEnv();

  return createSupabaseAdmin<Database>(
    serverEnv.NEXT_PUBLIC_SUPABASE_URL,
    serverEnv.SUPABASE_SERVICE_ROLE_KEY,
    {
      auth: {
        autoRefreshToken: false,
        persistSession: false,
      },
    }
  );
}
