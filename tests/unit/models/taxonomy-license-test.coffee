`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'taxonomy-license', {
  # Specify the other units that are required for this test.
  needs: ['model:npi-type', 'model:taxonomy-code']
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
