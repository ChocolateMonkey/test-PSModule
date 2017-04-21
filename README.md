# test-PSModule
test of a ps Module call test

## Things to remember

1. create a folder with the same name as the intended psd1 file.

2. Bare minimum is use `New-ModuleManifest` with `-Path` set as the intended psd1 file

3. Add location of root ps modules to `$env:PSModulePath`, for example, $env:PSModulePath += ";C:\PsModules"

Just dont forget, and I think that this is important, do not forget to name the folder that contains the psd1 the same name.
