`import DS from 'ember-data'`

NpiType = DS.Model.extend
  entityTypeCode: DS.attr('number'),
  replacementNpi: DS.attr('number'),
  enumerationDate: DS.attr('date'),
  lastUpdateDate: DS.attr('date'),
  npiDeactivationReasonCode: DS.attr('string'),
  npiDeactivationDate: DS.attr('date'),
  npiReactivationDate: DS.attr('date'),
  mailingAddress: DS.belongsTo('mailing-address', { async: false }),
  practiceLocationAddress: DS.belongsTo('practice-location-address', { async: false }),
  otherProviderIdentifiers: DS.hasMany('other-provider-identifier', { async: false }),
  taxonomyLicenses: DS.hasMany('taxonomy-license', { async: false }),
  taxonomyGroups: DS.hasMany('taxonomy-group', { async: false }),
  electronicServices: DS.hasMany('electronic-service', { async: false })

  classificationSpecialties: ( ->
    @get('taxonomyLicenses').map((license)->
      license.get('taxonomyCode').get('classificationSpecialty')
    ).uniq()
  ).property('taxonomyLicenses.@each.taxonomyCode.classificationSpecialty')

  classificationSummary: (->
    @get('taxonomyLicenses').map((license)->
      license.get('taxonomyCode').get('classification')
    ).uniq().join(', ')
  ).property('taxonomyLicenses.@each.taxonomyCode.classificationSpecialty')
`export default NpiType`
