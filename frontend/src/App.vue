<template>
  <v-app>
    <header-view></header-view>
    <v-content>
      <router-view/>
    </v-content>
  </v-app>
</template>
<style>

</style>
<script>
import { mdiAccount } from '@mdi/js'
// import store from './store'
import collection from 'easter-egg-collection'
export default {
	name: 'App',
  components: {

  },
	// store,
	data() {
		return {
		}
	}
}
</script>