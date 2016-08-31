## Readme

This repository contains scripts for generating areas through OSM that cover all enclosed polygons, regardless of whether or not they have a name. The number of buildings in OSM is extreme, so the world is broken up into bands and each band is processed in turn.

This process also uses a **LOT** of memory. It has only been tested on an OverpassAPI configured with 30GB RAM (open `src/overpass_api/core/settings.cc` and replace both lines that discuss `available_space` before compiling and installing OverpassAPI).

See `run_all.sh` for more details.