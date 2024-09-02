(cd sdk && fvm use && flutter build aar)
mv sdk/build/host/outputs/repo/com/example/infcurion_sdk/flutter_release/1.0/flutter_release-1.0.aar app/android/app/libs/
(cd sdk && fvm use && flutter build ios-framework -o ../app/modules/ios)
