'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"version.json": "357249d7e964e86510809c52d756b163",
"favicon.png": "2704101cb06ce66e2000356a312be25c",
"index.html": "31e58b1a6139e75ddb4136e8f35c36b5",
"/": "31e58b1a6139e75ddb4136e8f35c36b5",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "f024dbdb2bf65d5499c2409f007c7097",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "a5d7457fda15b7622c14f432ba63039a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "f25e8e701660fb45e2a81ff3f43c6d5c",
"assets/packages/wakelock_plus/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "f2163b9d4e6f1ea52063f498c8878bb9",
"assets/NOTICES": "261fcd4f4467c6de9a6352f111aa5c2b",
"assets/AssetManifest.json": "39d3c83337e372c15afa5a0f77bd4752",
"assets/AssetManifest.bin.json": "1683550ad91e88deab0623a9ef735704",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/assets/audios/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/rive_animations/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/pdfs/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/images/2_copy.png": "8a81ccc31d099c04f4c44f7917023f28",
"assets/assets/images/download-1.jpg": "940c5957886eb95a1cb1420b8061dd72",
"assets/assets/images/download_copy.png": "412f2045ecf7278b1fd1e963b6ddf407",
"assets/assets/images/vnimc_1.png": "64a7893f86e6d2ed9a5990da36aad2ca",
"assets/assets/images/Screenshot_2023-11-23_at_3.15.21_PM.png": "30d0f6a8fc0f9e9d78ae34dbd4d7dbc3",
"assets/assets/images/Screenshot_2023-11-23_at_3.09.29_PM.png": "cfb0d40852429df9b52d5b822cd54d4f",
"assets/assets/images/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/images/10.png": "48c8c573f1ec284a1268460fc4488957",
"assets/assets/images/Screenshot_2023-11-23_at_3.12.30_PM.png": "84fb3e87735f7fb1626415188612a92f",
"assets/assets/images/49svh_2.png": "1a5099673b7ec810d2b2aa21ec31cdf0",
"assets/assets/images/download.png": "77a54d52ddf80f78a8a3652e824d9e91",
"assets/assets/images/download-2.jpg": "bd53e565aa95fb3e1733fbb4fec77092",
"assets/assets/images/1_10.55.35.png": "a3f8e66772ed3ffc7d95456f09268bc8",
"assets/assets/images/3a9k2_3.png": "14e13fcf20ea94545f39eb9bc87447da",
"assets/assets/images/Screenshot_2023-11-23_at_3.12.17_PM.png": "feb746e4898123e26fbdff7dd2fdde46",
"assets/assets/images/45.png": "412f2045ecf7278b1fd1e963b6ddf407",
"assets/assets/images/download.jpg": "18afe807ede7f1da2de0434c6e912c6a",
"assets/assets/images/dfjsb_6.png": "b80f44a2f08e2ed755333d7725f7a23c",
"assets/assets/images/Screenshot_2023-11-23_at_3.12.47_PM.png": "361acec190491cbd03584892f322d0b6",
"assets/assets/images/2emqy_5.png": "ae5091c9c695cb776e41bb38216906be",
"assets/assets/images/download_(1).png": "97ef0a22bc19d9bc48282a9b87f12e28",
"assets/assets/images/4_copy.png": "20851c6c060fba806d1427c68964c905",
"assets/assets/images/k7eg7_8.png": "5467895e26c164e558bb2825bbcce406",
"assets/assets/images/x7hc1_7.png": "169b3d30dc7b7e213a539721d637a6b6",
"assets/assets/images/1_copy.png": "787585c77f3677870090aab8f5c36c38",
"assets/assets/images/download_3.png": "21e0fd3af08b41f9a1b08a41372da41f",
"assets/assets/images/nswz3_9.png": "1a5fd6774025559b6803b2e564d47161",
"assets/assets/images/fijek_4.png": "0a823d02691032ce19a3a84586f5e856",
"assets/assets/videos/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/lottie_animations/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/fonts/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/AssetManifest.bin": "14c0fd8cb5003cb2b7f9f4a82d396af3",
"assets/fonts/MaterialIcons-Regular.otf": "3926d0114ccaf321bd2b8948b8d0e8d5",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"main.dart.js": "f0d6ece143d845889cbdb8322a2eeac7"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
