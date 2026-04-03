-- Create todos table
create table if not exists todos (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) on delete cascade not null,
  title text not null,
  is_completed boolean not null default false,
  created_at timestamptz not null default now()
);

-- Enable row-level security
alter table todos enable row level security;

create policy "Users can select their own todos"
  on todos for select
  using (auth.uid() = user_id);

create policy "Users can insert their own todos"
  on todos for insert
  with check (auth.uid() = user_id);

create policy "Users can update their own todos"
  on todos for update
  using (auth.uid() = user_id);

create policy "Users can delete their own todos"
  on todos for delete
  using (auth.uid() = user_id);

-- Enable realtime for todos table
alter publication supabase_realtime add table todos;
