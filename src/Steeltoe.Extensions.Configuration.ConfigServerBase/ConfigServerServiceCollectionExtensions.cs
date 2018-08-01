using System;
using System.Data;
using System.Linq;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Steeltoe.Common.HealthChecks;

namespace Steeltoe.Extensions.Configuration.ConfigServer
{
    public static class ConfigServerServiceCollectionExtensions
    {
        public static IServiceCollection AddConfigServerHealthCheck(this IServiceCollection services, IConfiguration configuration)
        {
            if(!(configuration is IConfigurationRoot root))
                throw new ArgumentException($"Configuration must be a {nameof(IConfigurationRoot)}", nameof(configuration));
            var configServerSource = root.Providers.FirstOrDefault(x => x is ConfigServerConfigurationProvider);
            if(configServerSource == null)
                throw new InvalidOperationException("Config server is not registered as one of the sources in the configuration");
            services.Add(new ServiceDescriptor(typeof(IHealthContributor), configServerSource));
            return services;
        }
    }
}