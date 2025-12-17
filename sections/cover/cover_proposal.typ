#import "../../config.typ": *

#page(
  numbering: none,
  header: none,
  footer: none,
)[
  #align(horizon + center)[
    #text(1.2em, weight: "bold")[#upper[
      #context {
        let current_page = counter(page).get().first()
        if current_page == 1 {
          report_type
        } else {
          report_type2
        }
      }
    ]]
    \
    #text(1.2em, weight: "bold")[#upper[#title_block]]
    #image("../../media/logo_saq.jpg", width: 3in)
    #align(left)[
      #pad(left: 3cm)[
        #grid(
          columns: (auto, auto, auto, auto),
          row-gutter: .5em,
          column-gutter: 1em,
          [ANGGOTA], [:], [#member_names.at(0)], [#member_ids.at(0)],
          ..for i in range(1, member_names.len()) {
            ([], [:], member_names.at(i), member_ids.at(i))
          },
          [KELAS], [:], [#author_class], [],
          [DOSEN], [:], [#advisor_name], [],
          [ASISTEN], [:], [#reviewer_names.at(0)], [],
          ..for name in reviewer_names.slice(1) {
            ([], [:], name, [])
          }
        )
      ]
    ]
    #text(weight: "bold")[
      #upper[
        \
        \
        #faculty_of_study\
        #program_of_study\
        #campus_name \
        #year
      ]
    ]
  ]
]

