#!/bin/zsh

recipeFilePath="$1"
parentFolder="$(echo $recipeFilePath | awk -F'/' '{print $1}')"
recipeFileName="$(basename $recipeFilePath)"
recipeData=$(cat $recipeFilePath)

recipeName="$(echo $recipeData | sed -n 2p | awk -F'.' '{print $NF}')"
appName="$(echo $recipeData | sed -n 7p | cut -f2- -d':' | sed -e 's/"//g' -e 's/ //')"

downloadFileName="./$parentFolder/$appName.download.recipe.yaml"
pkgFileName="./$parentFolder/$appName.pkg.recipe.yaml"

downloadHeader="Description: Downloads the latest release of $appName.\n\
Identifier: com.mhrono.recipes.download.$recipeName\n\
MinimumVersion: '2.3'\n\
\n\
Input:\n\
  NAME: $appName\n\
\n\
Process:\n\
  - Processor: URLDownloaderPython\n\
  Arguments:\n\
    url: \n\
    filename: \n\
\n\
  - Processor: EndOfCheckPhase\n"

pkgHeader="Description: Downloads the latest release version of $appName and copies the downloaded package.\n\
Identifier: com.mhrono.recipes.pkg.$recipeName\n\
MinimumVersion: '2.3'\n\
ParentRecipe: com.mhrono.recipes.download.$recipeName\n\
\n\
Input:\n\
  NAME: $appName\n\
\n\
Process:\n\
  - Processor: Versioner\n\
  Arguments:\n\
    input_plist_path: \n\
    plist_version_key: 'CFBundleShortVersionString'\n"

if [[ ! -f "$downloadFileName" ]]; then
	echo "$downloadHeader" > $downloadFileName
fi

if [[ ! -f "$pkgFileName" ]]; then
	echo "$pkgHeader" > $pkgFileName
fi