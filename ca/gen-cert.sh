{

cat > ca-config.json <<EOF
{
  "signing": {
    "default": {
      "expiry": "87600h"
    },
    "profiles": {
      "dev-cluster": {
        "usages": ["signing", "key encipherment", "server auth", "client auth"],
        "expiry": "87600h"
      }
    }
  }
}
EOF

cat > ca-csr.json <<EOF
{
  "CN": "sagitta.dev",
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "BD",
      "L": "Boardbazar",
      "O": "Sagitta",
      "OU": "DevOps",
      "ST": "Gazipur"
    }
  ]
}
EOF

cfssl gencert -initca ca-csr.json | cfssljson -bare ca

}
