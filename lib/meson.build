vala_args = [ 
  '--target-glib', glib_min_version,
  '--thread',
  '--enable-checking',
]

librpgcore_sources = files([
  'src/Dice.vala',
  'src/Mutation.vala',
  'src/MutationGenerator.vala',
  'src/Ability.vala',
  'src/AbilityGenerator.vala',
  'src/Character.vala',
  'src/CharacterGenerator.vala'
])

librpgcore_dep = [ gio_dep, glib_dep, gee_dep, gsl_dep, json_dep ]

librpgcore = shared_library ( 'librpgcore',
  librpgcore_sources,
  librpgcore_resources,
  version: meson.project_version(),
  vala_gir: meson.project_name() + '-' + meson.project_version() + '.gir',
  vala_vapi: meson.project_name() + '.vapi',
  vala_header: meson.project_name() + '.h',
  dependencies: librpgcore_dep,
  c_args: [ '-g' ],
  link_args: ['-lm']
  # install: true,
  # install_dir: [true, true, true, true],
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
    'gio-2.0',
    'gsl'
  ],
)

lib_dep = declare_dependency(
    include_directories: include_directories('.'),
    link_with: librpgcore
)