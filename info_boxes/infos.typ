#import "./colors.typ":*
#set text(font:"New Computer Modern", lang:"en", size:10.5pt)

#let info-settings = (
    info:(
        prefix:none,
        icon:"circle-info",
        fill_color:ugent-blue.lighten(90%),
        stroke_color:ugent-blue,
    ),
    definition:(
        prefix:[#smallcaps[*Definition*]#smallcaps[:]],
        icon:"pencil",
        fill_color:caribbean-current.lighten(90%),
        stroke_color:caribbean-current,
    ),
    question:(
        prefix:none,
        icon:"circle-question",
        fill_color:proper-purple.lighten(90%),
        stroke_color:proper-purple,
    ),
    important:(
        prefix:none,
        icon:"circle-exclamation",
        fill_color:rgb("#228B22").lighten(90%),
        stroke_color:rgb("#228B22").darken(20%),
    ),
    conclusion:(
        prefix:none,
        icon:"lightbulb-solid",
        fill_color:earth-yellow.lighten(90%),
        stroke_color:earth-yellow,
    ),
    good:(
        prefix:none,
        icon:"circle-check",
        fill_color:rgb("#FFD700").lighten(90%),
        stroke_color:rgb("#FFD700").darken(20%),
    ),
    note:(
        prefix:[ *Remarks:* ],
        icon:"note-sticky",
        fill_color:rgb("#FFD700").lighten(90%),
        stroke_color:rgb("#FFD700").darken(20%),
    ),
);

#let info-stroke(kind:"good") = info-settings.at(kind).stroke_color

#let info-image(kind:"info", ..args) = {
    let settings = info-settings.at(kind);
    image(
        "../assets/solid/" + settings.icon + ".svg", ..args,
        alt:settings.icon,
    )
}

#let info-box(body, kind:"info", radius:5pt, footer:none, icon:true) = {
    let settings = info-settings.at(kind);
    let extra = if footer == none {
        none
    } else {
        align(right)[
            #set par(leading:0pt)
            #set text(size:10pt)
            #v(-8pt)
            #underline[#footer]
        ]
    }

    box(
        width:0.8fr,
        fill:settings.fill_color,
        stroke:1pt + settings.stroke_color,
        radius:radius,
        inset:0pt,
    )[
        #let contents = if icon {
            (
                image("./assets/solid/" + settings.icon + ".svg", width:24pt),
                {
                    settings.prefix
                    body
                    extra
                }
            )
        } else {
            (
                {
                    settings.prefix
                    body
                    extra
                },
            )
        }
        #table(
            columns:if icon { (38pt, 1fr) } else { 1 },
            inset:8pt,
            stroke:none,
            align:horizon,
            ..contents,
        )
    ]
}

= 5. Showcase

#info-box(" This is a definiton, the word of phrase in bold is the term being defined. They are generally adapter from the literature and are used for important elements that are not common knowledge for photonic engineers.",kind:"definition",footer:"Definition usually have a source in the footer") \

#info-box("This is an info box, it contains information that is tangential or useful for the understanding of the document, but not essential.",kind:"info") \

#info-box("This is a question box, it contains an important research question or hypthesis that is being investigated in the document.",kind:"question",footer:"The footer contains a link to where the question is answeared.")

#info-box("This is a conclusion or summary box, it contains a summary with key information that are needed for subsequent sections. Additionally, this is where answears to questeions and hypthesis are given.",kind:"conclusion")

\ 

#info-box("info",kind:"info")
\
#info-box("definition",kind:"definition")
\
#info-box("question",kind:"question")
\
//#info-box("Meow",kind:"important")
\
#info-box("conclusion",kind:"conclusion")
\
#info-box("good",kind:"good")
\
#info-box("note",kind:"note")
\

//#info-box("Hostify neni revoluce")
