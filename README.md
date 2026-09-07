# Reflect deployment

1. Create a free Supabase project and run `supabase-schema.sql` in its SQL Editor.
2. Enable Email authentication and add your Cloudflare Pages URL to Authentication → URL Configuration.
3. Copy the project URL and publishable/anon key into `config.js`. Never use a `service_role` key in this app.
4. Deploy this folder through Cloudflare Pages using no build command and this folder as the output directory.

The app saves each signed-in user’s daily goal and gratitudes to Supabase, protected by Row Level Security.
