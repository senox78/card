## how to embed real name

```sh
 typst compile card.typ card_real.pdf \
       --input show-role=true \
       --input 'role=所属'
       --input 'sub_name=本名'
```

## back side

The back side is a blank white page with the same dimensions as the front.
Both the paper and ink colors are defined in CMYK.

```sh
typst compile back.typ back.pdf
```
