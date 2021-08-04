# Trimmed down version of https://github.com/openSUSE/open-build-service/blob/b4f7daa7b8db21f17392ccf494d1d7e8ab14541d/src/api/lib/tasks/dev.rake
namespace :dev do
  desc 'Run all linters we use'
  namespace :lint do
    namespace :rubocop do
      namespace :auto_gen_config do
        desc 'Autogenerate rubocop config in rails and in root'
        task all: [:rails]

        desc 'Autogenerate rubocop config in rails'
        task :rails do
          # We set `exclude-limit` to 100 (from the default of 15) to make it easier to tackle TODOs one file at a time
          # A cop will be disabled only if it triggered offenses for more than 100 files
          sh 'rubocop --auto-gen-config --ignore_parent_exclusion --auto-gen-only-exclude --exclude-limit 100'
        end
      end
    end
  end
end
