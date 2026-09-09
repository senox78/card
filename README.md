## back side

The back side is a blank white page with the same dimensions as the front.
Both the paper and ink colors are defined in CMYK.

```sh
typst compile back.typ back.pdf \
      --input 'university=大学名' \
      --input 'university-email=name@example.ac.jp'
```

## build both sides

```sh
UNIVERSITY='大学名' \
UNIVERSITY_EMAIL='name@example.ac.jp' \
./build.sh
```

This creates `build/front.pdf` and `build/back.pdf`. Set `OUTPUT_DIR` to
change the destination. All input variables are optional.
