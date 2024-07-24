String generateVariationsText(
  List<Map<String, dynamic>> groups, {
  bool newLine = true,
}) {
  return groups
      .map((group) {
        final groupName = group['name'];
        final variations = group['variations'] as List;
        if (variations.isEmpty) return '';

        final selectedVariation = variations.first;
        final addonName = selectedVariation['addonName'];
        final variationName = selectedVariation['name'];

        final addons = selectedVariation['addons'] as List;
        final selectedAddons = addons.map((addon) => addon['name']).join(', ');

        return selectedAddons.isNotEmpty
            ? '$groupName: $variationName | $addonName: $selectedAddons'
            : '$groupName: $variationName';
      })
      .where((text) => text.isNotEmpty)
      .join(newLine ? '\n' : ' | ');
}

String generateItemsText(
  List items, {
  bool newLine = true,
}) {
  List<String> itemTexts = [];

  for (var item in items) {
    String itemText = '${item['quantity']} ${item['name']}';

    List<String> variationTexts = [];

    for (var group in item['variation_groups']) {
      final variations = group['variations'] as List;

      if (variations.isNotEmpty) {
        var selectedVariation = variations.first;
        String variationText = '${group['name']}: ${selectedVariation['name']}';

        final addons = selectedVariation['addons'] as List;

        if (addons.isNotEmpty) {
          List<String> addonNames =
              addons.map<String>((addon) => addon['name']).toList();
          variationText += ' (${addonNames.join(', ')})';
        }

        variationTexts.add(variationText);
      }
    }

    if (variationTexts.isNotEmpty) {
      itemText += ' (${variationTexts.join(', ')})';
    }

    itemTexts.add(itemText);
  }

  return itemTexts.join(newLine ? '\n' : ', ');
}
