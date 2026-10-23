-- Run once in Supabase: SQL Editor > New query > paste > Run
create table if not exists app_state(
  user_id uuid primary key references auth.users on delete cascade,
  state jsonb not null,
  updated_at timestamptz not null default now());
alter table app_state enable row level security;
create policy "own state" on app_state for all using (auth.uid()=user_id) with check (auth.uid()=user_id);

-- For real inverter telemetry later (written server-side with the service key, never the browser)
create table if not exists readings(
  id bigint generated always as identity primary key,
  user_id uuid not null references auth.users on delete cascade,
  ts timestamptz not null, metric text not null, value double precision, unit text,
  source text not null, data_type text not null check (data_type in ('measured','calculated','estimated','simulated')));
create index if not exists readings_user_ts on readings(user_id, ts desc);
alter table readings enable row level security;
create policy "read own readings" on readings for select using (auth.uid()=user_id);
