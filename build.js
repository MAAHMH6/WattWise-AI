// Static build: copies the site into dist/ and writes dist/config.js from Vercel env vars.
const fs = require('fs');
const out = 'dist';
fs.rmSync(out, { recursive: true, force: true });
fs.mkdirSync(out, { recursive: true });
for (const f of ['index.html', 'login.html']) fs.copyFileSync(f, out + '/' + f);
const env = {
  url: process.env.NEXT_PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL || '',
  key: process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || process.env.SUPABASE_ANON_KEY || ''
};
fs.writeFileSync(out + '/config.js', 'window.ENV=' + JSON.stringify(env) + ';');
console.log('Built WattWise AI ->', out, env.url ? '(Supabase configured)' : '(no Supabase env vars: local-only mode)');
