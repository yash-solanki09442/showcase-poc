param(
  [Parameter(Mandatory = $true)]
  [string]$TargetPath
)

$Source = Split-Path -Parent $PSScriptRoot
$Files = @(
  'index.html', 'shop.html', 'product.html', 'cart.html', 'wishlist.html', 'login.html',
  'products.js', 'vercel.json', '404.html', 'favicon.svg', 'package.json', 'README.md'
)
$Dirs = @('css', 'js')

if (-not (Test-Path $TargetPath)) {
  Write-Error "Target path not found: $TargetPath. Clone showcase-website first."
  exit 1
}

foreach ($f in $Files) {
  $src = Join-Path $Source $f
  if (Test-Path $src) {
    Copy-Item $src (Join-Path $TargetPath $f) -Force
    Write-Host "Copied $f"
  }
}

foreach ($d in $Dirs) {
  $srcDir = Join-Path $Source $d
  $dstDir = Join-Path $TargetPath $d
  if (Test-Path $srcDir) {
    if (-not (Test-Path $dstDir)) { New-Item -ItemType Directory -Path $dstDir | Out-Null }
    Copy-Item "$srcDir\*" $dstDir -Recurse -Force
    Write-Host "Copied $d/"
  }
}

Write-Host "Done. Commit and push in target repo to deploy Vercel."
