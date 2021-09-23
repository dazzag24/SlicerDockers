#!/bin/bash
set -e


VERSION="4.11.20210226"

#docker build --build-arg VERSION=${VERSION} -t dazzag24/base:$VERSION base
#docker build --build-arg VERSION=${VERSION} -t dazzag24/x11:$VERSION x11
docker build --build-arg VERSION=${VERSION} -t dazzag24/slicer:$VERSION slicer
exit 1

SLICER_MORPH_EXTS="MarkupsToModel Auto3dgm SegmentEditorExtraEffects Sandbox SlicerIGT RawImageGuess SlicerDcm2nii SurfaceWrapSolidify SlicerMorph"

docker build \
  --build-arg VERSION=${VERSION} --build-arg SLICER_EXTS="${SLICER_MORPH_EXTS}" \
  -t dazzag24/slicer-morph:$VERSION slicer-plus

SLICER_DMRI_EXTS="ukftractography SlicerDMRI"

docker build \
  --build-arg VERSION=${VERSION} --build-arg SLICER_EXTS="${SLICER_DMRI_EXTS}" \
  -t dazzag24/slicer-dmri:$VERSION slicer-plus

docker build --build-arg VERSION=${VERSION} -t dazzag24/slicer-dev:$VERSION slicer-dev


docker build -t dazzag24/slicer3:$VERSION slicer3
docker build --build-arg VERSION=${VERSION} --no-cache -t dazzag24/slicer-chronicle:$VERSION slicer-chronicle

