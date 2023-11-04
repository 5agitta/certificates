cat > ingress-csr.json <<EOF
{
    "hosts": [
        "*.sagitta.dev",
				"10.240.0.138",
				"10.240.0.139"
    ],
    "CN": "ingress.sagitta.dev",
    "key": {
        "algo": "rsa",
        "size": 2048
    },
    "names": [{
        "C": "BD",
        "L": "Boardbazar",
        "O": "Sagitta",
        "OU": "DevOps",
        "ST": "Gazipur"
    }]
}
EOF

cfssl gencert \
  -ca=../ca/ca.pem \
  -ca-key=../ca/ca-key.pem \
  -config=../ca/ca-config.json \
  -profile=dev-cluster \
  ingress-csr.json | cfssljson -bare ingress
