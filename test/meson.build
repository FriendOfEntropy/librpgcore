test_name = meson.project_name() + '-test'

test_sources = files([
  'TestRunner.vala',
  'DiceTests.vala',
  'MutationGeneratorTests.vala',
  'AbilityTests.vala',
  'AbilityGeneratorTests.vala',
  'CharacterGeneratorTests.vala',
  'AbstractTestCase.vala'
])

tests = executable(
    test_name,
    code_resources,
    sources: test_sources,
    dependencies: [ gio_dep, glib_dep, gee_dep, gsl_dep, lib_dep, json_dep ],
    c_args: [ '-g' ],
    link_args: ['-lm'],
    install: false
)

test('tests', tests)

