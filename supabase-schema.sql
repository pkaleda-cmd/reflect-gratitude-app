create table if not exists public.daily_journals (
  id bigint generated always as identity primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  journal_date date not null,
  daily_goal text not null default '',
  gratitudes jsonb not null default '[]'::jsonb,
  updated_at timestamptz not null default now(),
  unique (user_id, journal_date)
);
alter table public.daily_journals enable row level security;
create policy "read own journals" on public.daily_journals for select to authenticated using (auth.uid() = user_id);
create policy "insert own journals" on public.daily_journals for insert to authenticated with check (auth.uid() = user_id);
create policy "update own journals" on public.daily_journals for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "delete own journals" on public.daily_journals for delete to authenticated using (auth.uid() = user_id);
