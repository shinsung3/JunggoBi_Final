<template>
    <div>
        <v-app>
            <v-card>
            <v-tabs
                background-color="white"
                color="deep-purple accent-4"
                right
            >
                <v-tab>Landscape</v-tab>
                <v-tab>City</v-tab>
                <v-tab>Abstract</v-tab>
        
                <v-tab-item
                v-for="n in 3"
                :key="n"
                >
                <v-container fluid>
                    <v-row>
                    <search/>
                    </v-row>
                </v-container>
                </v-tab-item>
            </v-tabs>
            </v-card>
        </v-app>
    </div>
</template>
<script>
export default {
    data(){
        return {

        }
    },
    
}
</script>
<style>

</style>