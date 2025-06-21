# Workshop Template

Being a Teacher.

Create new project.

```
git clone 
```


## Gen docs

* Pre-conditions

```
Python 3.11
Pandoc 3.6+
LaTex pdf-engine=xelatex
HarmonyOS Sans SC
```

* Run script

```bash
scripts/gen-doc.sh
```

Then, deliver classes with session1-N/README.pdf. The whole class manual is at dist/MANUAL.pdf

## Upload public files

```bash
scripts/sync-public.sh
```

## Coach

Start to work as coach with materials in [coach.pdf](./coach.pdf).


## Checkout Workouts

Workouts are sample answers of session exercises.

## Write docs

Write docs with [Obsidian](https://obsidian.md/).

```
./scripts/gen-obsidian-vault.sh
```