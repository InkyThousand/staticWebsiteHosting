# AWS Portfolio Website

A minimalist portfolio showcasing AWS projects and cloud development journey.

## Current Setup (Static)
- **Framework**: Astro + Tailwind CSS
- **Pages**: Home, About, Projects
- **Deployment**: Ready for S3 + CloudFront

## Quick Start

```bash
# Install dependencies
npm install

# Start development server
npm run dev

# Build for production
npm run build
```

## Future Python Backend

The `python-backend/` folder contains FastAPI setup for dynamic features:

```bash
cd python-backend
pip install -r requirements.txt
python app/main.py
```

## Project Structure

```
├── src/                    # Astro source files
│   ├── components/         # Reusable components
│   ├── layouts/           # Page layouts
│   ├── pages/             # Route pages
│   └── styles/            # CSS files
├── public/                # Static assets
├── python-backend/        # Future FastAPI backend
│   ├── app/              # Application code
│   ├── templates/        # Jinja2 templates
│   └── static/           # Backend static files
└── docs/                 # Documentation
```