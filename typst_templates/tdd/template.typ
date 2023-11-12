#let template(
    //name of the association
    name: none,
    //date of the document
    date: none,
    //title of the document
    title: none,
    //logo of the association 
    logo: none,
    //footer
    footer: none,
    //abstract of the document 
    abstract: none,
    //body
    body
) = {

   set page(
        header: [#set text(fill:gradient.linear(..color.map.flare));  #name #h(1fr) #title],
        footer: [#emph(footer) #h(1fr) #counter(page).display()],
        numbering: "1",
        number-align: right
    )

    show heading.where(level:1): set text(fill:gradient.linear(..color.map.flare))
    show heading.where(level:2): set text(fill:gradient.linear(..color.map.flare))
    set heading(numbering: "1.1.")

    //set lang
    set text(lang: "fr",weight: "regular",size: 12pt)

    //set title
    {
    set text(weight: "bold",size: 24pt,fill:gradient.linear(..color.map.flare))
    align(center,title)
    
    //set name of the writer
    set text(weight: "regular", size: 20pt)
    align(center,name)

    //set date
    set text(size: 16pt)
    align(center,date)
    }

    //set logo 
    set text(weight: "regular", size: 12pt)
    figure(
        image(logo, width: 30%)
    )

    if abstract != "" {
    //set abstract
    align(center,par(justify: true)[
        = Abstract
        #abstract
    ])
    }

    //set page
    v(3em)


    //body
    body
}