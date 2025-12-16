#import "../../config.typ": *

#align(horizon + center)[
  #set text(weight: "bold")
  = Halaman Pengesahan
  
  #pad(bottom: 24pt)[
    #upper[#title_txt]
  ]
  
  #pad(bottom: 16pt)[
    #underline[#author_name] \
    #author_id
  ]
  #set text(weight: "regular")

  #pad(bottom: 16pt)[
    Proyek Akhir ini diajukan sebagai salah satu persyaratan untuk memperoleh gelar
    #degree
    di #campus_name
  ]

  *Disetujui oleh*

  #set par(first-line-indent: 0pt)
  #grid(
    columns: (180pt, 180pt),
    pad(bottom: 4em)[
      *Pembimbing,*
    ],
    pad(bottom: 4em)[
      *Penguji,*
    ],
    pad(bottom: 4em)[
      #align(start)[
      1. #underline[#advisor_name]\
         #advisor_id
      ]
    ],
    pad(bottom: 4em)[
      #align(start)[
      1. #underline[#reviewer_names.at(0)]\
         #reviewer_ids.at(0)
      ]
    ],
    [],
    [
      #align(start)[
      2. #underline[#reviewer_names.at(1)]\
         #reviewer_ids.at(1)
      ]
    ],
  )

  #pad(bottom: 4em)[*Mengetahui,*]
  
  Ketua Program Studi Teknik Informatika\
  #underline[#head_of_study_name]\
  #head_of_study_id
]

= Pernyataan

Dengan ini saya menyatakan bahwa dalam proyek akhir yang berjudul: \
*“#title_txt”* \
Adalah benar hasil karya saya, dan tidak mengandung karya ilmiah
atau tulisan yang pernah diajukan di suatu Perguruan Tinggi.

#par(first-line-indent: 0pt)[
Setiap kata yang dituliskan tidak mengandung plagiat, pernah ditulis
maupun diterbitkan orang lain kecuali yang secara tertulis diacu
dalam laporan proyek akhir ini dan disebutkan pada daftar pustaka.
Saya siap menanggung seluruh akibat apabila terbukti melakukan
plagiat.
]

#align(end)[
  #pad(bottom: 4em, top: 2em)[#date_of_release]
  #author_name
]
