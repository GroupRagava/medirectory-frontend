`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'practice-location-address', {
  # Specify the other units that are required for this test.
  needs: ['model:npi-type']
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
