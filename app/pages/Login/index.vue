<template>
  <div class="container mx-auto h-full flex justify-center items-center">
    <div class="w-1/3">
      <h1 class="font-hairline mb-6 text-center">Login</h1>
      <div class="border-teal p-8 border-t-12 bg-white mb-6 rounded-lg shadow-lg">
        <div class="mb-4">
          <label class="block text-grey-darker text-sm font-bold mb-2">Email</label>
          <input
            v-model="auth.email"
            type="text"
            class="w-full shadow appearance-none border rounded py-2 px-3 text-grey-darker leading-tight focus:outline-none focus:shadow-outline"
            placeholder="Your Email">
        </div>

        <div class="mb-4">
          <label class="block text-grey-darker text-sm font-bold mb-2">Password</label>
          <input
            v-model="auth.password"
            type="password"
            class="w-full shadow appearance-none border rounded py-2 px-3 text-grey-darker leading-tight focus:outline-none focus:shadow-outline"
            placeholder="Your Password">
        </div>

        <div class="flex items-center justify-center">
          <custom-button @click="onClick" color="bg-green" icon="fas fa-check">
            Login
          </custom-button>
        </div>
      </div>
      <div class="text-center">
        <p class="text-grey-dark text-sm">
          Don't have an account?
          <nuxt-link to="/register" class="no-underline text-blue font-bold">
            Create an Account
          </nuxt-link>
        </p>
      </div>
    </div>
  </div>
</template>

<script>
import CustomButton from '@/components/CustomButton'
export default {
  middleware: 'preventIfAuthenticated',
  components: {
    CustomButton
  },
  data () {
    return {
      auth: {
        email: '',
        password: ''
      }
    }
  },
  computed: {
    isLoggedIn () {
      return this.$auth.loggedIn
    }
  },
  watch: {
    isLoggedIn (so) {
      if (so) {
        this.$router.replace('/')
      }
    }
  },
  methods: {
    onClick () {
      this.$auth.loginWith('local', {
        data: {
          auth: this.auth
        }
      })
    }
  }
}
</script>

<style>
</style>
