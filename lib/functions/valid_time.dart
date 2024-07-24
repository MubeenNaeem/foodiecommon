bool isValidTime(String time) {
  final regex = RegExp(r'^\d{2}:\d{2}$');

  if (!regex.hasMatch(time)) return false;

  final parts = time.split(':');
  final hours = int.tryParse(parts[0]);
  final minutes = int.tryParse(parts[1]);

  if (hours == null ||
      minutes == null ||
      hours < 0 ||
      hours > 23 ||
      minutes < 0 ||
      minutes > 59) {
    return false;
  }

  return true;
}
