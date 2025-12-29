# General course materials

This submodule is included in all new BIFX course repositories that contains general course assets. This is managed as follows:

* Addition of the submodule: `git submodule add https://github.com/Hood-BIFX/general_course_materials general_course_materials`
* Initialiation of the submodule (i.e. if the folder is empty after cloning the repository): `git submodule update --init --recursive`
* Update the submodule when changes have been made in the source repository: `git submodule update --remote --merge`

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

#### render syllabus to Word with - this may require minor manual edits (e.g. to tables)
quarto render --profile docx

#### Render and post on Blackboard with:
quarto render --profile blackboard

## Add office hours under Course Information
You can [book a virtual or in person office visit](https://hood.campus.eab.com/pal/dkT4mB31MS) with me at your convenience. <update to your own personal scheduling link as needed>

## Blackboard gradebook

Use of the Blackboard gradebook is highly recommended. This gives students real-time feedback on grades and reduces the burden on the instructor when grades are due. Be sure to display grades as a percentage, as the default letter grades do not follow Hood College graduate school standard grade distributions.

Some grade categories that I frequently use include:

* Attendance: Tied to the Blackboard attendance. When a student is marked as "excused" for a class, that week is not included in the calculated grade. It is recommended to give students a makeup assignment in Blackboard for excused absences.
* Assignments: I typically use these for makup assignments for excused absences. Any ungraded assignment will not be included in the final grade. Thus, these can be assigned to specific students on a case-by-case basis without affecting other student grades.
* Homework
* Quiz
* Presentation
* Exam
