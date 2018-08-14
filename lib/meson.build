vala_args = [ 
  '--target-glib', glib_min_version,
  '--thread',
  '--enable-checking',
]

lib_sources = files([
  'Dice.vala'
])

librpgcore = shared_library ( 'rpgcore',
  lib_sources,
  version: meson.project_version(),
  vala_gir: meson.project_name() + '-' + meson.project_version() + '.gir',
  vala_vapi: meson.project_name() + '.vapi',
  vala_header: meson.project_name() + '.h',
  dependencies: [ glib_dep, gee_dep, gsl_dep ],
  c_args: [ '-g' ],
  link_args: ['-lm'],
  install: true,
  install_dir: [true, true, true, true],
)

pkg.generate(
  libraries: librpgcore,
  version: meson.project_version(),
  name: meson.project_name(),
  description: 'Open soure role playing game core utility library written in Vala',
  requires: [
    'glib-2.0',
    'gobject-2.0',
    'gee-0.8',
    'gsl'
  ],
)

lib_dep = declare_dependency(
    sources: lib_sources
)