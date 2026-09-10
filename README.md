# General course materials

This submodule is included in all new BIFX course repositories that contains general course assets. This is managed as follows:

* Addition of the submodule: `git submodule add https://github.com/Hood-BIFX/general_course_materials general_course_materials`
* Initialiation of the submodule (i.e. if the folder is empty after cloning the repository): `git submodule update --init --recursive`
* Update the submodule when changes have been made in the source repository: `git submodule update --remote --merge`

If git complains about file paths being too long, you may need to enable long paths in git with (this only seems to be an issue with Windows):

```
git config --global core.longpaths true
```

## Rendering course websites

### render and push changes to the `origin-pages` branch with
general_course_materials/publish.sh  # Mac/Linux
general_course_materials/publish.ps1 # Windows

### for manual builds and/or previewing pages:

#### render/preview website with (default profile is "book")
quarto render
quarto preview

#### render all slides with
quarto render --profile slides

#### render syllabus to Word with - this may require minor manual edits (e.g. to tables and svg graphics)
quarto render --profile docx

## Add office hours under Course Information
You can [book a virtual or in person office visit](https://hood.campus.eab.com/pal/dkT4mB31MS) with me at your convenience. <update to your own personal scheduling link as needed>

## Inserting website on Blackboard

Often inserting a link is sufficient, but to insert a website on Blackboard (i.e. as a frame inside the document), follow these steps:

* Navigate to the desired content area in your Blackboard course.
* Click to add a new item and select "Create" then "Document".
* When you add a new content block, select "HTML" and insert the following code (after editing the url):

```
<style>
  .my-embed {
    width: 100%;
    height: 800;
  }
</style>

<iframe src="https://bifx551-26.github.io/CourseInfo/" class="my-embed"></iframe>
```


## Blackboard gradebook

Use of the Blackboard gradebook is highly recommended. This gives students real-time feedback on grades and reduces the burden on the instructor when grades are due. Be sure to display grades as a percentage, as the default letter grades do not follow Hood College graduate school standard grade distributions.

Some grade categories that I frequently use include:

* Attendance: Tied to the Blackboard attendance. When a student is marked as "excused" for a class, that week is not included in the calculated grade. It is recommended to give students a makeup assignment in Blackboard for excused absences.
* Assignments: I typically use these for in-class exercises
* Homework
* Quiz
* Presentation
* Exam

## ADA

Main things to *always* include

-   Use headers (i.e. level 2, 3, ... starting with `##`, `###`, etc...)
-   Use `lang: en` in YAML header
-   Always use `fig-alt` header for figures
-   Use descriptive text in links (e.g. `[Download the Analysis Workflow](https://...)` instead of `[click here](https://...)`)

### General YAML headers

-   subtitle: "Additional context"
-   lang: en

### html format tags

-   toc: true
-   toc-depth: 3
-   smooth-scroll: true
-   html-math-method: mathjax
-   code-copy: true
-   df-print: kable

### pdf format tags

-   pdf-standard: ua-2
-   pdf-engine: lualatex

Validation: Install veraPDF (quarto install verapdf) to have Quarto automatically validate PDF/UA compliance after each render.

### Code chunks and figures

```{r}
#| label: fig-expression-distribution
#| fig-cap: "Distribution of gene expression values across treatment groups."
#| fig-alt: "Boxplot showing median normalized counts of 450 in the control group versus 820 in the treated group with tight interquartile ranges."
#| echo: false

boxplot(values ~ group, data = df)
```

```
![Visible caption](path/to/image.png){fig-alt="Descriptive alternative text for screen readers"}
```

### Tables

```
| Sample ID | Condition | Batch |
|:----------|:----------|:------|
| S01       | Control   | 1     |
| S02       | Treated   | 1     |
: Table caption {#tbl-samples}
```
