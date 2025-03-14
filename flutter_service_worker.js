'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "7605c19b859d6149bd17a30d209da151",
"assets/AssetManifest.bin.json": "4a4f888801da9f32e4c1913d608beef6",
"assets/AssetManifest.json": "2b05a53df8945aedb63411d592131cd4",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "9aa490da62ca1c8683626abe3effc5cc",
"assets/images/bor3om/majal/bor3ommajal(0).png": "cd7a0ae80f1f8b034fb9b50812b7789a",
"assets/images/bor3om/majal/bor3ommajal(1).png": "e1bab8f13b9a8a4c7272144cf3973464",
"assets/images/bor3om/majal/bor3ommajal(2).png": "5072bd5628bef91b9d86f6afcf21fdab",
"assets/images/bor3om/majal/bor3ommajal(3).png": "0b3390d4a7034f7970aeef32f8b35085",
"assets/images/bor3om/majal/bor3ommajal(4).png": "4487060dfb2925473b4ddf044aef2ff2",
"assets/images/bor3om/majal/bor3ommajal(5).png": "59320289be9c238b0f2874646ba2d0d1",
"assets/images/bor3om/majal/bor3ommajal(6).png": "e623306e80b76bab93a99208b9fd3586",
"assets/images/bor3om/majal/bor3ommajal(7).png": "9023586b7b1a31afe04ef94379be8603",
"assets/images/bor3om/majal/bor3ommajal(8).png": "a3fe19ede5a8d4d70493b25bc72d7e88",
"assets/images/bor3om/majal/bor3ommajal(9).png": "8a3fc7a2fe2961237db6491d323cf66b",
"assets/images/bor3om/wesem/bor3omwesem(0).png": "a1cd5b0eddcbb1bbb1e42be76a5d6c1c",
"assets/images/bor3om/wesem/bor3omwesem(1).png": "dd86e64448e7be09211c02e5e26599c4",
"assets/images/bor3om/wesem/bor3omwesem(10).png": "2a3fb824c74e2adf11051fd3d8562692",
"assets/images/bor3om/wesem/bor3omwesem(11).png": "54c0eac999cc156089954658b9a52445",
"assets/images/bor3om/wesem/bor3omwesem(12).png": "9968008070f668b1f72b6ec1ea9da49a",
"assets/images/bor3om/wesem/bor3omwesem(13).png": "e7a0c4cbd19c3d5fa54356b5fd79bb05",
"assets/images/bor3om/wesem/bor3omwesem(14).png": "9469031eff74197c7161b2e01e812ad4",
"assets/images/bor3om/wesem/bor3omwesem(15).png": "0dce0459a9f15b21738fa545519d6537",
"assets/images/bor3om/wesem/bor3omwesem(16).png": "e7c95c76fa2fc262433cefcc03ee1b81",
"assets/images/bor3om/wesem/bor3omwesem(17).png": "173ab1719a262925ba0e700e4b10e448",
"assets/images/bor3om/wesem/bor3omwesem(18).png": "945ffd463ad0049a347eec400d1c0ff5",
"assets/images/bor3om/wesem/bor3omwesem(19).png": "29aa50f1d83511d32b6438f010eabe83",
"assets/images/bor3om/wesem/bor3omwesem(2).png": "b1f86ab6fc4352d0fd8b7764dbfd335a",
"assets/images/bor3om/wesem/bor3omwesem(20).png": "5b9531e116162b55597c1e088b0fba7a",
"assets/images/bor3om/wesem/bor3omwesem(21).png": "39cf73330f58cc3e9acd0f3b63468ca7",
"assets/images/bor3om/wesem/bor3omwesem(22).png": "025dfe062472931ad5f78ef512b5deb1",
"assets/images/bor3om/wesem/bor3omwesem(23).png": "da8174dae9f962e9a8a37049863ecaa8",
"assets/images/bor3om/wesem/bor3omwesem(3).png": "bd44c48c5b7071cec03267775ae9fc30",
"assets/images/bor3om/wesem/bor3omwesem(4).png": "12e73bce421f90b51e39c1125a27a577",
"assets/images/bor3om/wesem/bor3omwesem(5).png": "78eb126f37cd21953836e63000771aa2",
"assets/images/bor3om/wesem/bor3omwesem(6).png": "238118c10498e9dd157f39592ec7f39a",
"assets/images/bor3om/wesem/bor3omwesem(7).png": "dc35856704649332cc35f445f3c03a76",
"assets/images/bor3om/wesem/bor3omwesem(8).png": "fef0958404cb249c5eb711ef422fb9fe",
"assets/images/bor3om/wesem/bor3omwesem(9).png": "ab19fe2e05b35c66887f7371c29edb21",
"assets/images/kashef/majal/kashefmajal(0).png": "c1ef238de40a0871223543d2ed6c7325",
"assets/images/kashef/majal/kashefmajal(1).png": "fbe91228afeed3cf9faaf4fb5ea69b9d",
"assets/images/kashef/majal/kashefmajal(2).png": "b1157003259bdb80f77bd7d370cf81a4",
"assets/images/kashef/majal/kashefmajal(3).png": "26fbfc10537fa22ff878311f01435387",
"assets/images/kashef/majal/kashefmajal(4).png": "48a4d1e15777041a08a5482f33726d61",
"assets/images/kashef/majal/kashefmajal(5).png": "d1988efdc4e7a5cde692ef95978ef363",
"assets/images/kashef/majal/kashefmajal(6).png": "de9d5401cc182d8430c14a6ac4c49978",
"assets/images/kashef/majal/kashefmajal(7).png": "7b6f2ee20c788345850132558c990fbe",
"assets/images/kashef/majal/kashefmajal(8).png": "63b7a8e5cd94355d1656468959c6fb36",
"assets/images/kashef/majal/kashefmajal(9).png": "998343e52b4285ced31c1c1b2b667eba",
"assets/images/kashef/wesem/kashefwesem(0).png": "e4276ce744612553ef74e9135e177ff3",
"assets/images/kashef/wesem/kashefwesem(1).png": "b4162e2e8d762c0902d0c4cea7c2d75f",
"assets/images/kashef/wesem/kashefwesem(10).png": "6c5a02daebfba14b5239eaf4d085d719",
"assets/images/kashef/wesem/kashefwesem(11).png": "24d3eb57e34df78e553bcd08bbd16f27",
"assets/images/kashef/wesem/kashefwesem(12).png": "1bdd7c3b52b112b33aee1881aa53e4e5",
"assets/images/kashef/wesem/kashefwesem(13).png": "89d3e2dc6cecf9717be18ad84c4b0f85",
"assets/images/kashef/wesem/kashefwesem(14).png": "99acedfb16142203982e40c60504dd65",
"assets/images/kashef/wesem/kashefwesem(15).png": "f6d63e4da54f55af3263c39c70300d40",
"assets/images/kashef/wesem/kashefwesem(16).png": "2952012910900c6c370aeb513ebc59ed",
"assets/images/kashef/wesem/kashefwesem(17).png": "20b2820856c96354bc987b17c6345851",
"assets/images/kashef/wesem/kashefwesem(18).png": "b6ac1203ad874250e164a7d1b48fa926",
"assets/images/kashef/wesem/kashefwesem(19).png": "25b2cad25f0952e24b1adc1c965f5222",
"assets/images/kashef/wesem/kashefwesem(2).png": "6c8e68e8d9cd3e559d782338d57379c7",
"assets/images/kashef/wesem/kashefwesem(20).png": "e7e7877cd5c2f88cad0e583e90e3967e",
"assets/images/kashef/wesem/kashefwesem(21).png": "8e2d7570a69e06073231d8acc11d8712",
"assets/images/kashef/wesem/kashefwesem(22).png": "f1cbc552a88173385d5da21e96a99cde",
"assets/images/kashef/wesem/kashefwesem(23).png": "80bdc804c4c8c62496251f48936752e7",
"assets/images/kashef/wesem/kashefwesem(24).png": "90b5f32f42664e13588fbca64737330f",
"assets/images/kashef/wesem/kashefwesem(25).png": "a7c92d7436a5ffcb6c61da5845f440fb",
"assets/images/kashef/wesem/kashefwesem(3).png": "71c2e874b92bfd2b253b6193443a13be",
"assets/images/kashef/wesem/kashefwesem(4).png": "1a2174b5e8d31312bfdc70f4789d4f23",
"assets/images/kashef/wesem/kashefwesem(5).png": "67e91ab0ab39e8a81440d05163c757d2",
"assets/images/kashef/wesem/kashefwesem(6).png": "9ded7b795ebdbedcd4140f3b364dc8ca",
"assets/images/kashef/wesem/kashefwesem(7).png": "9c9a488a8af5c04727a2213b29d67392",
"assets/images/kashef/wesem/kashefwesem(8).png": "c012191e19f292804a2b1764eddba8b4",
"assets/images/kashef/wesem/kashefwesem(9).png": "9488bd0404d4ffefeb4f23470f7a88a0",
"assets/images/zaharat/majalet/zahramajal(0).png": "0d3da0b6c91c7877806a7fccc85b0ce1",
"assets/images/zaharat/majalet/zahramajal(1).png": "b1744ec4d44bab22ca5d065a97d6ca6e",
"assets/images/zaharat/majalet/zahramajal(2).png": "30b17ce9524e90dd44f9e905c2b4c9e9",
"assets/images/zaharat/majalet/zahramajal(3).png": "f9ab6f5eea160f8cd72576ff17710e4e",
"assets/images/zaharat/majalet/zahramajal(4).png": "c6c4d033620e2fd1be99d6bfd14685e9",
"assets/images/zaharat/majalet/zahramajal(5).png": "f0fb198b11790d75102f1573d1ca245c",
"assets/images/zaharat/majalet/zahramajal(6).png": "dd0e2cf10741936fcd52f4daf1e2bbf4",
"assets/images/zaharat/majalet/zahramajal(7).png": "a1e308332bc87112aca374b827b13545",
"assets/images/zaharat/majalet/zahramajal(8).png": "628e039251469f92c8b17e3457160aef",
"assets/images/zaharat/majalet/zahramajal(9).png": "0e9772b0208edceb8d7286aa5dbb7677",
"assets/images/zaharat/wesem/zahrawesem(27).png": "8d0f719b5fc4771cdc3c5f840fd40bb0",
"assets/NOTICES": "25bd01d971451f75335046f7df2135d2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "6cfe36b4647fbfa15683e09e7dd366bc",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "ba4a8ae1a65ff3ad81c6818fd47e348b",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "eb52f8adc943b575a45718a9f10708ce",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "d23ad737eb347428fa37bbd58a034cc3",
"/": "d23ad737eb347428fa37bbd58a034cc3",
"main.dart.js": "0d7d886a3a06e7fa4d1a36af5bbe1108",
"manifest.json": "60c36ff17ed76c7b8632c2a66cb55c27",
"version.json": "b7c0bae353f49c6ea7d95e6041ca7f64"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
