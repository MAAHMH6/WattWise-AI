# WattWise AI
Static website (index.html + login.html) with Supabase login/database. Hosted on Vercel.

All files live at the top level of the repo - no folders needed.

1. Supabase: run `schema.sql` in SQL Editor; copy Project URL + anon public key.
2. Vercel: import this repo, add env vars NEXT_PUBLIC_SUPABASE_URL and NEXT_PUBLIC_SUPABASE_ANON_KEY, Deploy.
Without the env vars the site runs in local-only mode.
