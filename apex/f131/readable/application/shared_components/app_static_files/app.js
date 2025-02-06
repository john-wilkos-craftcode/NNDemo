 /* === #APP_IMAGES#js/app.js === */

// Public key from Firebase
// CHANGE THIS VALUE TO YOUR FIREBASE PUBLIC KEY
var firebaseVapidPublicKey = 'BPQjVWQO4J4Sxv1Pbd7WSefXfwxszXanUQ_tEJ1WtVopGrwaTpZN3x70aKG42yG-XnScCRaX3KycOd2pH07uGoo';

// REST endpoint where we store requests for push notifications
// CHANGE THIS VALUE TO YOUR FIREBASE DATABASE
var firebaseNotificationEndpoint = 'https://fieldside-centerfield-default-rtdb.europe-west1.firebasedatabase.app/notifications.json';
/**
* @namespace pwa
**/



           /* navigator.serviceWorker.ready.then(function(registration) {
              registration.showNotification('Successfully subscribed!', {
                  body: 'You have successfully subscribed to our APEX notification service.',
                  icon: '#APP_FILES#app-131-logo.png',
                  badge: '#APP_FILES#app-131-logo.png'
                });
          })
        */

var pwa = pwa || {};

var apexServiceWorker = null;
var endpointStarter = null;
var p256dhStarter = null;
var authStarter = null;

var decoder = new TextDecoder('utf8');

function urlBase64ToUint8Array(base64String) {
    const padding = '='.repeat((4 - base64String.length % 4) % 4);
    const base64 = (base64String + padding).replace(/\-/g, '+').replace(/_/g, '/');

    const rawData = window.atob(base64);
    const outputArray = new Uint8Array(rawData.length);

    for (let i = 0; i < rawData.length; ++i) {
        outputArray[i] = rawData.charCodeAt(i);
     }
        return outputArray;
}

const base64Arraybuffer = async (data) => {
  const base64url = await new Promise((r) => {
    const reader = new FileReader();
    reader.onload = () => r(reader.result);
    reader.readAsDataURL(new Blob([data]));
  });
  return base64url.split(",", 2)[1];
};








pwa.notification = {
    /**
     * @function ask
     * @example pwa.notification.ask();
     * Requests the permission to allow notifications
     **/
    ask: function () {
      // Request permission to subscribe to notifications
      Notification.requestPermission(function (result) { // (1)
        if (result === 'granted') {
          console.log('Notification permission granted!');
  
          // Subscribe to the notification
          navigator.serviceWorker.ready.then(function(registration) {
                registration.pushManager.subscribe({ // (2)
                userVisibleOnly: true,
                applicationServerKey: urlBase64ToUint8Array(firebaseVapidPublicKey)
              })
            .then(function (notification) {
              // POST the notification subscription to Firebase
              // notification.json below could be anything

              endpointStarter = notification.endpoint;
              console.log("endpoint: ", endpointStarter)

            base64Arraybuffer(notification.getKey("p256dh")).then(function(result) {
                p256dhStarter = result;
                p256dhStarter = p256dhStarter.replace("/","_");
                p256dhStarter = p256dhStarter.replace("+","-");
                p256dhStarter = p256dhStarter.replaceAll("=","");
                console.log("p256dh: ", p256dhStarter);
            });

                 
            base64Arraybuffer(notification.getKey("auth")).then(function(result) {
                authStarter = result;
                authStarter = authStarter.replace("/","_");
                authStarter = authStarter.replace("+","-");
                authStarter = authStarter.replaceAll("=","");
                console.log("auth: ", authStarter);
            });


              return fetch(firebaseNotificationEndpoint, { // (3)
                method: 'POST',
                headers: {
                  'Content-Type': 'application/json'
                },
                body: JSON.stringify(notification)
              });
            })
            .then(function (res) {
              if (res.ok) {
                // Show the first notification (4)
                navigator.serviceWorker.ready.then(function(registration) {
                    registration.showNotification('Successfully subscribed!', {
                  body: 'You have successfully subscribed to our APEX notification service.',
                  icon: 'r/ctb_stage_centerfield/131/files/static/v222/fieldside-green.png',
                  badge: 'r/ctb_stage_centerfield/131/files/static/v222/fieldside-green.png'
                });
                    apex.server.process ( "NOTIFICATION_KEYS", {
                        x01: endpointStarter,
                        x02: p256dhStarter,
                        x03: authStarter
                     });
              });
              }
            })
            .catch(function (err) {
              console.error('Subscribing to notifications failed.', err);
            });
          })
        }
      else {
          console.warn('Notification permission denied.');
        }
      });
    }
  };

