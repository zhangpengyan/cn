using System;
using Jaeger.Propagation;
using OpenTracing.Propagation;

namespace OpenTracingDemo.ServiceCollectionExtensions
{
    public class JaegerCodec<T>  
    {
        public IFormat<T> Format { get; set; }

        public Codec<T> Codec { get; set; }
    }
}
