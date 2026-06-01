# -*- coding: utf-8 -*-
import zipfile
from pathlib import Path

folder = Path(__file__).parent
img_dir = folder / "images"
img_dir.mkdir(exist_ok=True)

docx_files = list(folder.glob("*.docx"))
if docx_files:
    with zipfile.ZipFile(docx_files[0]) as z:
        for name in z.namelist():
            if name.startswith("word/media/"):
                out = img_dir / Path(name).name
                out.write_bytes(z.read(name))
                print("extracted:", out.name)
else:
    print("no docx found, skip extract")

try:
    from PIL import Image
except ImportError:
    print("Pillow not installed, skip resize (pip install pillow)")
    raise SystemExit(0)

max_px = 1000
for p in sorted(img_dir.glob("*.jp*g")):
    im = Image.open(p)
    if max(im.size) > max_px:
        im.thumbnail((max_px, max_px), Image.Resampling.LANCZOS)
        im.save(p, quality=82, optimize=True)
        print("resized:", p.name, "->", im.size)
    else:
        print("ok:", p.name, im.size)
