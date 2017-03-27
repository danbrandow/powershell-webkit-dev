# Copyright (c) 2017, the WebKit for Windows project authors.  Please see the
# AUTHORS file for details. All rights reserved. Use of this source code is
# governed by a BSD-style license that can be found in the LICENSE file.

<#
  .Synopsis
  Installs CMake.

  .Description
  Downloads the specified release of CMake and installs it silently on the host.

  .Parameter Version
  The version of CMake to install.

  .Example
    # Install 3.7.2
    Install-CMake -Version 3.7.2
#>
Function Install-CMake {
  Param(
    [Parameter(Mandatory)]
    [string] $version
  )

  $major, $minor, $patch = $version.split('.');

  $url = ('https://cmake.org/files/v{0}.{1}/cmake-{2}-win64-x64.msi' -f $major, $minor, $version);

  $options = @(
    '/quiet',
    '/qn',
    'ADD_CMAKE_TO_PATH="System"'
  );

  Install-FromMsi -Name 'cmake' -Url $url -Options $options;
}
