/// A placeholder class that represents an entity or model.
class OpenPosition {

  OpenPosition(
    this.id,
    this.title,
    this.stack,
    this.experienceYears,
    this.client,
    this.industry,
    this.description,
    this.requirements,
    this.ableTo,
    this.url
  );

  final int id;
  final String title;
  final String stack;
  final int experienceYears;
  final String client;
  final String industry;
  final String? description;
  final String requirements;
  final String? ableTo;
  final String url;
}
