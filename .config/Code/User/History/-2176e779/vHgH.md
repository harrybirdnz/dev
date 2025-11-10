---
title: "Building a Blog with MDsveX"
date: "2025-11-05"
excerpt: "Learn how to integrate markdown content into your SvelteKit application using MDsveX."
---

# Building a Blog with MDsveX

MDsveX is a markdown preprocessor for Svelte that allows you to use Svelte components inside your markdown files. It's perfect for building blogs and documentation sites.

## What is MDsveX?

MDsveX extends markdown with the ability to:

- Use Svelte components in markdown
- Add frontmatter for metadata
- Syntax highlighting for code blocks
- Custom layouts for markdown pages

## Installation

Install MDsveX in your SvelteKit project:

```bash
npm install -D mdsvex
```

Then configure it in your `svelte.config.js`:

```javascript
import { mdsvex } from "mdsvex";

export default {
  extensions: [".svelte", ".svx"],
  preprocess: [mdsvex()],
};
```

## Using Components in Markdown

One of the coolest features is embedding Svelte components:

```svelte
<script>
  import MyComponent from './MyComponent.svelte';
</script>

# My Article

<MyComponent prop="value" />

More markdown content here...
```

## Frontmatter

Add metadata to your posts using YAML frontmatter:

```yaml
---
title: My Post Title
date: 2025-11-05
author: Your Name
---
```

## Conclusion

MDsveX makes it incredibly easy to build content-rich sites with SvelteKit. The combination of markdown and Svelte components is powerful and flexible.
