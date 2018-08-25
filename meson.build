project ('com.friendofentropy.librpgcore', ['vala', 'c'],
          version: '0.5',
          license: 'MIT',
          default_options: [
            'warning_level=1',
            'buildtype=debugoptimized',
            ],
          meson_version: '>= 0.45.0'
          )

PROJECT_NAME = meson.project_name ()
API_VERSION = '0.5'
PROJECT_VERSION = meson.project_version ()
VERSIONED_PROJECT_NAME = PROJECT_NAME+'-'+API_VERSION
CAMEL_CASE_NAME = 'libRPGCore'
VERSIONED_CAMEL_CASE_NAME = CAMEL_CASE_NAME +'-'+ API_VERSION

vala_version_required = '0.36.15'
vala = meson.get_compiler('vala')
if not vala.version().version_compare('>= @0@'.format(vala_version_required))
	error('valac >= @0@ required!'.format(vala_version_required))
endif

# Imports
pkg = import('pkgconfig')

gnome = import('gnome')
librpgcore_resources = gnome.compile_resources(
    'librpgcore-resources', 'lib/data/' + meson.project_name() + '.gresource.xml',
    source_dir: 'lib/data'
)

# Dependencies
glib_min_version = '2.48.2'
glib_dep = dependency ('glib-2.0', version: '>=' + glib_min_version)
gobject_dep = dependency ('gobject-2.0', version: '>=' + glib_min_version)
gio_dep = dependency ('gio-2.0', version: '>=' + glib_min_version)
gee_dep = dependency ('gee-0.8', version: '>=0.20.0')
gsl_dep = dependency ('gsl')
json_dep = dependency ('json-glib-1.0', version: '>=1.0')


subdir ('lib')
subdir ('test')