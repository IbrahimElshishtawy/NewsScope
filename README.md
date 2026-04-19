# NewsScope

A premium Arabic news application built with **Flutter** and **GetX**, designed with a formal classic newsroom identity and enhanced with modern 3D-inspired UI elements.

## Overview

NewsScope is a modular mobile news presentation app that simulates the structure of a professional TV news program. It includes multiple editorial sections such as headlines, main news, reports, economy, sports, weather, and breaking news, all presented through a responsive Flutter interface.

The project follows a **GetX-based architecture** with separated modules, bindings, controllers, routes, shared widgets, and theme layers to keep the codebase scalable and maintainable.

## Key Features

- Arabic-first user interface with RTL-friendly layout
- Flutter + GetX architecture
- Named routing with bindings for each screen
- Reusable shared widgets
- Professional classic news visual identity
- 3D-inspired cards and layered UI presentation
- Mock data support for rapid prototyping
- Responsive layouts for different mobile sizes
- Dedicated sections for:
  - Splash
  - Home Dashboard
  - Intro
  - Headlines
  - Main News
  - Report
  - Quotes / Statements
  - Local News
  - Arab News
  - International News
  - Economy
  - Breaking News
  - Sports
  - Weather
  - Outro

## Tech Stack

- **Flutter**
- **Dart**
- **GetX** for:
  - State management
  - Routing
  - Dependency injection

## Architecture Notes

This project follows a **feature-first modular structure**:

- **views** contain UI screens
- **controllers** manage state and presentation logic
- **bindings** register dependencies for each route
- **shared widgets** are reused across multiple modules
- **theme files** define colors, typography, and visual tokens
- **data layer** contains models, mock content, and repository logic

Each class is expected to live in its own file to improve readability and maintenance.

## UI / Design Direction

The app is styled to reflect a **formal classic broadcast news system** while incorporating a more premium digital layer.

### Visual characteristics

- Dark navy blue, red, white, and gray palette
- Clean Arabic typography
- Layered cards and 3D-inspired panels
- Broadcast-style section headers and tickers
- Elevated content containers for premium presentation

## Available Sections

### Splash
Opening screen with logo and brand reveal.

### Home
Dashboard that navigates to all news sections.

### Intro
Broadcast-style opening scene for the news program.

### Headlines
Displays the main bulletin headlines.

### Main News
Highlights the lead story with featured presentation.

### Report
Dedicated special report layout with media and analysis.

### Quotes
Official statements and highlighted quotes.

### Local News
Covers domestic and city-level updates.

### Arab News
Regional Arabic news section.

### International News
Global events and international developments.

### Economy
Financial indicators, market summaries, and economic analysis.

### Breaking News
Urgent updates and fast-moving coverage.

### Sports
Scores, match summaries, and sports highlights.

### Weather
Forecasts, temperatures, and weather alerts.

### Outro
Closing screen and program ending.

