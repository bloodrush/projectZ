const LOGIN_QUERY = '''
mutation Login(\$email:String!, \$pass:String!) {
  login(data:{email: \$email,password: \$pass}) {
    user {
      firstName
      secondName
    }
  }
}
''';

