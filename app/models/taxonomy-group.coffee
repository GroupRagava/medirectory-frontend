`import DS from 'ember-data'`

TaxonomyGroup = DS.Model.extend
  taxonomyGroup: DS.attr('string'),
  entity: DS.belongsTo('npi-type', {polymorphic: true, async: false})

`export default TaxonomyGroup`
