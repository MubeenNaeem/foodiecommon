const kCash = 'Cash';
const kCard = 'Card';
const kPickup = 'Pickup';
const kDelivery = 'Delivery';
const kProductsLastLoaded = 'products_last_loaded';
const kUserLastLoggedin = 'user_last_loggedin';

String weekday(int day) {
  return [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ][day];
}
