if (! this.sh_languages) {
  this.sh_languages = {};
}
sh_languages['bib'] = [
  [
    [
      /@[A-Za-z]+(?=\{)/g,
      'sh_bibtex',
      1,
      1
    ],
    [
      /[A-Za-z]+(?=[ \t]*=)/g,
      'sh_string',
      -1
    ]
  ],
  [
    [
      /[A-Za-z0-9\-]+/g,
      'sh_argument',
      -1
    ],
    [
      /,/g,
      'sh_normal',
      -2
    ],
    [
      /=/g,
      'sh_normal',
      -2
    ]
  ]
];
