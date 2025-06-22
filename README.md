# Workshop Template

Being a Teacher, build workshop with this tempalte.

Create a new project.

```
export WORKSHOP_NAME=YOUR_WORKSHOP_NAME
mkdir $WORKSHOP_NAME && cd "$_"
curl -L https://github.com/hailiang-wang/WorkshopTemplate/tarball/master | tar xz --strip-components=1
code . # open with VSCode
```

e.g.

```
export WORKSHOP_NAME=llm-tangshan2025
mkdir $WORKSHOP_NAME && cd "$_"
curl -L https://github.com/hailiang-wang/WorkshopTemplate/tarball/master | tar xz --strip-components=1
code . # open with VSCode
```

## Workshop Structure

```
WORKSHOP
├── assets    # images, docs, etc.
│   ├── media
│   └── _obsidian
├── COACH.m.md  # Coach guide lines sources.
├── COACH.pdf   # Coach guide lines pdf generated with scripts/gen-doc.sh.
├── LICENSE
├── public
│   └── README.md
├── README.md
├── requirements.txt # deps to run scripts/gen-doc.sh.
├── scripts
│   ├── gen-doc.sh   # build docs from Markdown files.
│   ├── gen-obsidian-vault.sh  # setup Obsidian Vault
│   └── sync-public.sh   # publish files
├── sessions         # Challenges 
│   ├── MANUAL.m.md  # Class guide as a whole pdf.
│   ├── MANUAL.pdf   # generated with scripts/gen-doc.sh.
│   ├── session1     # session 1, deliver each README.pdf to students, or this session folder with materials.
│   ├── session2     # session 2
│   ├── ...          # more sessions
│   └── sessionN     # session N
└── workouts
    ├── README.m.md  # workouts README doc.
    ├── README.pdf   # generated with scripts/gen-doc.sh.
    ├── session1     # session 1 execise answer sample
    └── session2     # session 2 execise answer sample
```

## Gen docs

* Pre-conditions

```
Python 3.11
Pandoc 3.6+
LaTex pdf-engine=xelatex
HarmonyOS Sans SC
sed
```

* Run script

```bash
pip install -r requirements.txt
scripts/gen-doc.sh
```

Then, deliver classes with session1-N/README.pdf. The whole class manual is at dist/MANUAL.pdf

## Commit updates

### Upload public files

```bash
scripts/sync-public.sh
```

### Commit git

```bash
./scripts/commit.sh "Add script"
```

## Coach

Start to work as coach with materials in [coach.pdf](./coach.pdf).


## Checkout Workouts

Workouts are sample answers of session exercises.

## Write docs

### Writting in Obsidian

Write docs with [Obsidian](https://obsidian.md/).

```
./scripts/gen-obsidian-vault.sh
```

### Generate Sessions in Batch

```bash
cd sessions
mkdir session{1..8}
touch session{1..8}/README.md
for x in {1..8}; do echo "# session $x" > session$x/README.md; done
```

Next, include the README.md in sessions/MANUAL.m.md.

## Others

* [Workshop Template](https://github.com/hailiang-wang/WorkshopTemplate)