# Noida Apartment Map

Interactive map for finding rental apartments near Leverage Edu, Sector 126.
Centered on the office, with 60+ premium and mid-range societies across Sectors 50, 51, 70, 75-79, 93, 94, 97, 100, 104, 107, 110, 119, 121, 124, 128, 137, 143, 146, 150, 152, 168, and Greater Noida West.

## Run locally

```bash
./serve.sh
```

This opens [http://localhost:8000](http://localhost:8000) in your default browser.

Use a different port if 8000 is taken:

```bash
./serve.sh 8001
```

Stop the server with `Ctrl+C`.

## Alternative ways to serve

If you don't have Python:

```bash
# Node.js
npx serve -p 8000

# PHP
php -S localhost:8000

# Ruby
ruby -run -e httpd . -p 8000
```

Or open `index.html` directly in a browser (some features like OSRM routing may behave differently from `file://` due to CORS, but the map itself will work).

## Files

| File | Purpose |
|------|---------|
| `index.html` | Main interactive map (Leaflet + Google Maps tiles) |
| `listings.html` | Per-society rental site comparison page |
| `serve.sh` | Local dev server (Python 3) |
| `README.md` | This file |

## Editing societies

All society data lives in the `SOCIETIES` array inside `index.html`. Each entry:

```js
{
  name: "Society Name",
  sector: "Sector 128",
  area: "sec128",        // sec128 | sec7x | central | expressway
  lat: 28.5288,
  lng: 77.4038,
  band: "ultra",         // mid | premium | ultra
  rent: "₹70k-1.5L",
  bhk: "3/4 BHK",
  status: "ready",       // ready | new | upcoming (omit for ready)
  notes: "Brief notes..."
}
```

Add new entries inline; no rebuild needed — just refresh the browser.

## Filters available in the UI

- **Price band**: All / Mid / Premium / Ultra
- **Area**: Sector 128 / Sector 75-78 / Expressway / Central
- **Status**: All / Ready / New / Upcoming
- **Sort**: Distance / Price (asc) / Price (desc) / Name

## Tech stack

- **Map**: [Leaflet 1.9.4](https://leafletjs.com/) with Google Maps tile overlay
- **Routing**: [OSRM public demo server](http://project-osrm.org/) for live driving distance/time; Haversine fallback
- **Images**: Loremflickr for contextual hero images; Google Images search links for actual society photos
- **Fonts**: Inter + JetBrains Mono via Google Fonts
- **No build step.** Pure HTML/CSS/JS.

## Known caveats

- **OSRM rate limits**: The public demo server is rate-limited. For heavy use, self-host OSRM (Docker image available) or use a paid routing API.
- **Google Maps tiles via Leaflet**: Technically against Google's TOS for commercial use. For a personal tool it's fine; for production, get a Google Maps API key and use their official JavaScript SDK.
- **Society images**: The hero images are contextual (real apartment buildings matching the band tier) but not exact photos of each specific society. Click the "Photos" button on any popup for the actual society — opens Google Images.
- **Rent ranges**: 2025–26 indicative figures. Verify on MagicBricks/99acres/NoBroker before broker visits.

## License

Personal use. Society data compiled from public sources.
