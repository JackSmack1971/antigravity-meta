# Awesome-Skills Catalog & Usage

The `.agents/skills/` directory holds over 1,400+ domain-specific abilities.

### How to Invoke Skills
Within the Antigravity chat IDE, invoke any skill explicitly by prompt:  
`"Use the [skill-name] skill to..."`

### Maintenance
To update the repository of skills dynamically, run:  
`npx antigravity-awesome-skills --update`

### Standard Example
`"Use the nextjs-15-app-router skill to scaffold a minimal Next.js 15 landing page under src/."`
The framework will parse the exact boilerplate formats inside the `.agents/skills/` directory matching the tag.
